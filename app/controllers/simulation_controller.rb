class SimulationController < ApplicationController

  def main
    @pierce_image = PierceImage.all
  end
end
