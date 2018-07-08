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

  describe 'GET #new' do
    before { get :new }

    it 'assigns a new Transport to @transport' do
      expect(assigns(:transport)).to be_a_new(Transport)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new transport' do
        expect { post :create,
                 params: { transport: attributes_for(:transport) }
               }.to change(Transport, :count).by(1)
      end

      it 'redirects to root_path' do
        post :create, params: { transport: attributes_for(:transport) }
        expect(response).to redirect_to root_path
      end
    end

    context 'with invalid attributes' do
      it 'does not save the transport' do
        expect { post :create,
                 params: { transport: attributes_for(:invalid_transport) }
               }.to_not change(Transport, :count)
      end

      it 're-renders new view' do
        post :create, params: { transport: attributes_for(:invalid_transport) }
        expect(response).to render_template :new
      end
    end
  end

end
