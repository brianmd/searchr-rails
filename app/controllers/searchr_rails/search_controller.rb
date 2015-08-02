require_dependency "searchr_rails/application_controller"

module SearchrRails
  class SearchController < ApplicationController
    def self.search_query_class
      unless @search_klass
        raise 'You must call SearchrRails::SearchController.search_query_class = AQueryClass (should be a subclass of Searchr::SolrQuery'
      end
      @search_klass
    end

    def self.search_query_class=(klass)
      @search_klass = klass
    end

    def index
      query = self.class.search_query_class.new
      query.query = params[:query] if params[:query]
      ignore_errors{ query.start_row = Integer(params[:start_row]) if params[:start_row] }
      ignore_errors{ query.num_rows = Integer(params[:num_rows]) if params[:num_rows] }
      query.fields_to_query = params[:query_fields] if params[:query_fields]
      query.fields_to_return = params[:fields_to_return] if params[:fields_to_return]
      result = query.search
      data = { result: result, show_fields: query.fields_to_return, params: params }

      respond_to do |format|
        format.html { render locals: data }
        format.json {
          render json: data, status: solr.status
        }
      end
    end

    def ignore_errors
      yield
    rescue
    end
  end
end
