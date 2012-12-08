task :begin => :environment do
  sects = ["Energy","Materials","Industrials","Consumer Discretionary","Consumer Staples","Health Care","Financials","Information Technology","Telecommunication Services","Utilities"]
  sects.each do |sect|
    @sector = Sector.new(params[:sector])
    @sector.name = sect
    @sector.wacc = 0.08
    @sector.save
  end
end