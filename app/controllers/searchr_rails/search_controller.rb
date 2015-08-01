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
      result = self.class.search_query_class.new.search

      respond_to do |format|
        format.html { render locals: { result: result }}
        # format.json {
        #   data = {explain_rows: @solr.explain_rows, response: @solr.body, explain: @solr.explain}
        #   render json: data, status: solr.status
        # }
      end
    end
  end
end
