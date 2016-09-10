class ResetsController < ApplicationController
  def index
      @title = "RESETS BE CAREFUL!"
  end
    
  def target_count
      @targets = Target.all
      Target.update_all("count = 0")
      redirect_to targets_path
  end
    
  def target_reset
      Target.update_all("mines = 0")
      redirect_to targets_path
  end
    
  def group_reset
      @groups = Group.all
      Group.update_all("points = 0")
      Group.update_all("false_information = false")
      Group.update_all("kopfgeld = 0")
      redirect_to root_path     
  end
end

        
      