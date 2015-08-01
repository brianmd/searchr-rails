require_dependency "searchr_rails/application_controller"

module SearchrRails
  class SearchController < ApplicationController
    def self.search_query_class
      EnronQuery
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
