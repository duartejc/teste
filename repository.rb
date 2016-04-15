require 'csv'
require_relative 'file_not_found_exception'

class Repository
    
  attr_accessor :elements
    
  def initialize(source)
      @source = source
      @elements = []
      load_from_source()
  end
  
  def all
    self.elements
  end
  
  private
    def load_from_source
      raise FileNotFoundException.new("Arquivo nao encontrado: #{@source}") unless File.exist?(@source)
      
      elements = @elements
      CSV.foreach(File.path(@source)) do |row|
        elements << row
      end
    end
  
end
