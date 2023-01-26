class ApplicationController < ActionController::Base
  layout(false)

  # Add your actions below this line
  # ================================

  # def homepage
  # end

  def square_form
    render({ :template => "calculator_templates/square_form.html.erb" })
  end

  def square_results
    @input_number = params.fetch("user_number").to_f
    @number_squared = @input_number ** 2

    render({ :template => "calculator_templates/square_results.html.erb" })
  end

  def square_root_form
    render({ :template => "calculator_templates/square_root_form.html.erb" })
  end

  def square_root_results
    @input_number = params.fetch("user_number").to_f
    @number_square_rooted = @input_number ** 0.5
    render({ :template => "calculator_templates/square_root_results.html.erb" })
  end

  def payment_form
    render({ :template => "calculator_templates/payment_form.html.erb" })
  end

  def payment_results
    @input_apr = params.fetch("user_apr").to_f
    puts(@input_apr)

    apr = @input_apr / 100
    @input_years = params.fetch("user_years").to_i
    @input_principal = params.fetch("user_pv").to_i

    @rate = apr / 12
    @period = @input_years * 12
    @present_apr = @input_principal * 100

    @payment = (@rate * @input_principal) / (1 - ((1 + @rate) ** (@period * -1)))

    render({ :template => "calculator_templates/payment_results.html.erb" })
  end

  def random_form
    render({ :template => "calculator_templates/random_form.html.erb" })
  end

  def random_results
    @input_min = params.fetch("user_min").to_f
    @input_max = params.fetch("user_max").to_f

    @random_number = rand(@input_min..@input_max)

    render({ :template => "calculator_templates/random_results.html.erb" })
  end
end
