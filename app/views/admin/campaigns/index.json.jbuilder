json.array!(@campaigns) do |campaign|
  json.extract! campaign, :id, :name, :company_id, :start_date, :end_date
  json.url campaign_url(campaign, format: :json)
end
