class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contact
  end

  def submit_contact
    # Here you would handle the form submission, e.g., send an email or save the message.
    flash[:notice] = "We have received your message and will get back to you shortly."
    redirect_to contact_path
  end
end
