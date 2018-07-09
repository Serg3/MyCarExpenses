require 'rails_helper'

RSpec.describe ExpensesController, type: :controller do
  let(:transport) { create(:transport) }

  describe 'GET #new' do
    before { get :new, params: { transport_id: transport } }

    it 'assigns a new Expense to @expense' do
      expect(assigns(:expense)).to be_a_new(Expense)
    end

    it 'renders new view' do
      expect(response).to render_template :new
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new expense' do
        expect { post :create,
                 params: { expense: attributes_for(:expense), transport_id: transport }
               }.to change(Expense, :count).by(1)
      end

      it 'redirects to transport_path' do
        post :create, params: { expense: attributes_for(:expense), transport_id: transport }
        expect(response).to redirect_to transport_path(transport)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the expense' do
        expect { post :create,
                 params: { expense: attributes_for(:invalid_expense), transport_id: transport }
               }.to_not change(Expense, :count)
      end

      it 're-renders new view' do
        post :create, params: { expense: attributes_for(:invalid_expense), transport_id: transport }
        expect(response).to render_template :new
      end
    end
  end

end
