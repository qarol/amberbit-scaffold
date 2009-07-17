module Searchable::Helper
  def searchable_form
    form_tag '', :method => :get, :class => 'searchable' do
      concat hidden_field_tag(:order, params[:order], :id => nil)
      concat "\n"
      concat text_field_tag(:query, params[:query], :id => nil)
      concat "\n"
      concat submit_tag(t('search'), :name => nil)
      concat "\n"
      concat link_to(t('clear'), searchable_clear)
      concat "\n"
    end
    concat "\n"
  end

  def searchable_clear
    path_options = params.dup
    path_options[:query] = nil
    url_for(path_options)
  end

  def searchable_h(value, options={})
    value = h(value) if options[:escape] || options[:escape].nil?
    highlight(value.to_s, params[:query])
  end
end
