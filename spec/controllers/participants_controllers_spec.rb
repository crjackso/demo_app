require 'spec_helper'

describe ParticipantsController do

  describe 'POST create' do
    let (:petition_json_request) {{
        participant: {
            first_name: 'Vivian',
            last_name: 'So',
            email: 'vivian@mail.com',
            country_code: 'United States'
        },
        microsite: { name: 'nowisourmoment.org' },
        format: 'json'
    }}
    it 'should sign a petition successfully' do

      post :create, petition_json_request

      response.should be_success
    end

    it 'should respond with a valid params' do
      post :create, petition_json_request

      parsed_response_body = JSON.parse(response.body)

      parsed_response_body['success'].should == true
      parsed_response_body['participant_id'].should_not eql 1
      parsed_response_body['unique_url'].should_not be_nil
    end

  end
end