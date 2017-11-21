class Task < ApplicationRecord

  attr_writer :state
  before_validation :state_definer
  before_validation :set_default_done, on: :create

  def state
    done ? "done" : "to do"
  end

  private

  def state_definer
    p "je suis la"
    p @state
    if @state == "done"
      self.done = true
    elsif @state == "to do"
      self.done = false
    end
  end

  def set_default_done
    self.done = false if done.nil?
  end
end


