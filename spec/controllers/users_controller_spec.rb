require 'spec_helper'

describe UsersController do
  context '#schema' do
    context 'get' do
      before {get :schema, format: :json}

      it { response.body.should eq User.new.attributes.keys.to_json  }
    end
  end
end
