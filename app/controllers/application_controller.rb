class ApplicationController < ActionController::Base
  def blank_square_form
    render({:template => "calculation_templates/square_form.html.erb", })
  end

  def calculate_square
    # params = {"elephant"=>"42"}
    @num = params.fetch("elephant").to_f
    @square_of_num = @num**2
    render({:template => "calculation_templates/square_results.html.erb", })
  end

  def blank_random_form
    render({:template => "calculation_templates/random_form.html.erb", })
  end

  def calculate_random
    @lower = params.fetch("user_min").to_f
    @upper = params.fetch("user_max").to_f
    @result = rand(@lower..@upper).to_f

    render({ :template => "calculation_templates/rand_results.html.erb"})
  end

  def blank_payment_form
    render({:template => "calculation_templates/payment_form.html.erb", })
  end

  def calculate_payment
    @int = params.fetch("APR").to_f
    @interest = @int/100
    @int = @int.to_s(:percentage)
    @interest = @interest/12
    @years = params.fetch("number_years").to_f
    @months = @years*12
    @years = @years.round()
    @pv = params.fetch("present_value").to_f
    @payment = (@interest*@pv)/(1-(1+@interest)**(-@months))
    #@payment = @payment.round()
    #@payment = @payment.to_f

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

  def blank_square_root_form
    render({:template => "calculation_templates/square_root_form.html.erb", })
  end

  def calculate_square_root
    # params = {"elephant"=>"42"}
    @num = params.fetch("elephant").to_f
    @square_root_of_num = @num**0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end

end