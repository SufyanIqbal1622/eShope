require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    # Here we're using FactoryBot, but you could use anything
    subject { build(:product) }

    it { should validate_presence_of(:name) }
    end

end
# RSpec.describe ProductsController, type: :controller do
#   describe 'GET #index' do
#     subject { get :index }

#     # This may work...
#     it { should have_http_status(:success) }
#     # ...but this will not!
#     it { should permit(:name, :price).for(:product) }
#   end
# end
