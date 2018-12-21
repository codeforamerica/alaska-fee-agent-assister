class WantDirectDepositForm < Form
  set_attributes_for :navigator, :want_direct_deposit

  def save
    interview.navigator.update(attributes_for(:navigator))
  end
end
