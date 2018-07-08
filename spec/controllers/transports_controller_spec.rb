require 'rails_helper'

RSpec.describe TransportsController, type: :controller do
  let(:transport) { create (:transport) }

  describe 'GET #index' do
    let(:transports) { create_list(:transport, 2) }

    before { get :index }

    it 'populates an array of all transports' do
      expect(assigns(:transports)).to match_array(transports)
    end

    it 'renders index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    before { get :show, params: { id: transport } }

    it 'assigns the requested transport to @transport' do
      expect(assigns(:transport)).to eq transport
    end

    it 'renders show view' do
      expect(response).to render_template :show
    end
  end

end
