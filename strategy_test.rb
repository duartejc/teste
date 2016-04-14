require 'rake'
require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << "test"
  t.test_files = FileList['test/test*.rb']
  t.verbose = true
end

module StrategyTest  
  def execute
    p "executing #{self}"
    Rake.application['test'].invoke('one')
  end
end
