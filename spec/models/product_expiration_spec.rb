require File.dirname(__FILE__) + "/../spec_helper"

describe Product do
  it 'should return products whose deleted_at datetime has not yet passed' do
    Product.destroy_all
    @never_expires   = Factory(:product, :deleted_at => nil)
    @expired         = Factory(:product, :deleted_at => 1.minute.ago)
    @not_yet_expired = Factory(:product, :deleted_at => 5.minutes.from_now)
    Product.not_deleted.should == [@never_expires, @not_yet_expired]
  end
end
