require File.dirname(__FILE__) + "/../spec_helper"

describe Product do
  before(:each) do
    Product.destroy_all
    @never_expires   = Factory(:product, :deleted_at => nil)
    @expired         = Factory(:product, :deleted_at => 1.minute.ago)
    @not_yet_expired = Factory(:product, :deleted_at => 5.minutes.from_now)
  end

  it 'should return products whose deleted_at datetime has not yet passed' do
    Product.not_deleted.should == [@never_expires, @not_yet_expired]
  end

  it 'should be deleted after deleted_at has passed' do
    @never_expires.should_not be_deleted
    @expired.should be_deleted
    @not_yet_expired.should_not be_deleted
  end
end
