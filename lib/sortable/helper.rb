module Sortable::Helper
  def sortable_th(attribute, options={})
    content_tag :th,
      if @sort_columns.include? attribute
        if @sort_order.nil?
          raise 'Call sortable_order_sql in your controller before rendering the view'
        end

        sort_order = @sort_order.downcase

        if @sort_by.to_sym == attribute
          options[:class] ||= ''
          options[:class] << " sorted #{sort_order}"
          # reverse sort order for already selected column
          sort_order = sort_order == 'asc' ? 'desc' : 'asc'
        else
          sort_order = 'asc'
        end

        path_options = params.dup
        path_options[:order] = "#{attribute}-#{sort_order}"
        url = url_for(path_options)
        link_to(t("attribute.#{attribute}"), url)
      else
        t("attribute.#{attribute}")
      end,
      options
  end
end
