class CatRentalRequest < ActiveRecord::Base
  default_scope { order(start_date: :asc) }
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED)}
  validates :cat_id, :start_date, :end_date, presence: true

   validate :overlapping_approved_requests

  belongs_to :cats,
    primary_key: :id,
    foreign_key: :cat_id,
    class_name: :Cat

    def overlapping_requests
      requests = CatRentalRequest.where(cat_id: cat_id)

      overlap = []
      requests.each do |request|
        if self.id != nil
          next if request.id = self.id
        end
        if !(self.start_date >= request.end_date || self.end_date <= request.start_date)
          overlap << request
        end
      end
      overlap
    end

  def overlapping_approved_requests
    overlap = overlapping_requests
    overlap.each do |overlap|
      if overlap.status == "APPROVED"
        errors[:cat_id] << "overlapping request"
      end
    end
  end

  def approve!
    CatRentalRequest.transaction do
      self.status = "APPROVED"
      self.save
      overlap = self.overlapping_requests
      overlap.each { |request| request.deny! } unless overlap.empty?
    end
  end

  def deny!
    self.status = "DENIED"
    self.save
  end

  def pending?
    status == 'PENDING'
  end
end
