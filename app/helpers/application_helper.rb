module ApplicationHelper
  def form_field_errors(object, method)
    errors = object.errors[method]
    if errors.present?
      render partial: 'application/errors', locals: {errors: errors}
    end
  end
end
