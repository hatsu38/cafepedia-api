class Prefecture < JpPrefecture::Prefecture
  alias_method :id, :code

  def self.where(options)
    ids = Array(options[:id]).map(&:to_s).select(&:present?)
    self.all.select { |pref| ids.include?(pref.id.to_s) }.compact
  end
end
