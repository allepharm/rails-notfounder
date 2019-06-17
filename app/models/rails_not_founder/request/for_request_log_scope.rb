class RailsNotFounder::Request::ForRequestLogScope
  def self.call(*args)
    new(*args).call
  end

  def initialize(date_from)
    self.date_from = date_from
  end

  def call
    parent
      .select(<<-SQL.squish)
        'url' AS url,
        COUNT(*) AS count
      SQL
      .where("created_at >= ?", date_from)
      .group("url")
      .order("count DESC")
  end

  private

  attr_accessor :date_from

  delegate :parent, to: :class
end
