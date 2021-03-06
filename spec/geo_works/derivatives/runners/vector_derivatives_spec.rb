# frozen_string_literal: true
require 'spec_helper'
require 'fileutils'

RSpec.describe GeoWorks::Derivatives::Runners::VectorDerivatives do
  describe "#create" do
    let(:outputs) do
      [
        {
          input_format: input_mime_type,
          label: :display_vector,
          id: 'file_set_id',
          format: 'zip',
          url: display_vector_uri
        },
        {
          input_format: input_mime_type,
          label: :thumbnail,
          id: 'file_set_id',
          format: 'png',
          size: '200x150',
          url: thumbnail_uri
        }
      ]
    end

    before do
      described_class.source_file_service = LocalFileService
      described_class.output_file_service = OutputFileService
    end

    after do
      # Cleanup generated derivatives, unless KEEP env variable is set
      unless ENV['KEEP']
        FileUtils.rm(display_vector_uri.path)
        FileUtils.rm(thumbnail_uri.path)
      end
    end

    context "with a zipped shapefile" do
      let(:input_file_path) { Pathname.new(test_data_fixture_path('files/vector/shapefile.zip')) }
      let(:input_mime_type) { 'application/zip; ogr-format="ESRI Shapefile"' }
      let(:display_vector_uri) { test_derivative_url('shapefile_display_vector', 'zip') }
      let(:thumbnail_uri) { test_derivative_url('shapefile_thumbnail', 'png') }

      it_behaves_like "a set of vector derivatives"
    end

    context "with a geojson file" do
      let(:input_file_path) { Pathname.new(test_data_fixture_path('files/vector/geojson.json')) }
      let(:input_mime_type) { 'application/vnd.geo+json' }
      let(:display_vector_uri) { test_derivative_url('geojson_display_vector', 'zip') }
      let(:thumbnail_uri) { test_derivative_url('geojson_thumbnail', 'png') }

      it_behaves_like "a set of vector derivatives"
    end

    context "with a KML file" do
      let(:input_file_path) { Pathname.new(test_data_fixture_path('files/vector/example.kml')) }
      let(:input_mime_type) { 'application/vnd.google-earth.kml+xml' }
      let(:display_vector_uri) { test_derivative_url('kml_display_vector', 'zip') }
      let(:thumbnail_uri) { test_derivative_url('kml_thumbnail', 'png') }

      it_behaves_like "a set of vector derivatives"
    end
  end
end
