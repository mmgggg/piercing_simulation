class SimulationController < ApplicationController

  def main
    @pierce_image = PierceImage.where.not(pierce_image: nil)
  end
end
