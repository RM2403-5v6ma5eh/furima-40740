require 'rails_helper'

RSpec.describe "Orders", type: :request do

  describe "POST /create" do
    before do
      @order_form_attributes = FactoryBot.attributes_for(:order_form)
    end

    it 'creates a new order and ship' do
      expect {
        post item_orders_path(@order_form_attributes[:item_id]), params: { order_form: @order_form_attributes }
      }.to change(Order, :count).by(1).and change(Ship, :count).by(1)
    end

  end

end
