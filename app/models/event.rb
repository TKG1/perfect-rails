class Event < ApplicationRecord
  has_many :tickets, dependent: :destroy
  belongs_to :owner, class_name: "User"

  validates :name, presence: true, length: {maximum: 50}
  validates :place, presence: true, length: {maximum: 100}
  validates :content, presence: true, length: {maximum: 2000}
  validates :start_at, presence: true
  validates :end_at, presence: true
  validate :start_at_should_be_before_end_at

  def created_by?(user)
    return false unless user
    owner_id == user.id
  end

  private

  def start_at_should_be_before_end_at
    return unless start_at && end_at

    if start_at >= end_at
      errors.add(:start_at, 'は終了時間より前に設定してください')
    end
  end

end
