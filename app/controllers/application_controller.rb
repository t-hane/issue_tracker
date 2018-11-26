class ApplicationController < ActionController::Base

  helper_method :current_user


  protected

  #
  # 現在ログイン中のユーザーを取得します。
  #
  # @return [User]
  #
  def current_user
    @current_user ||= begin
      if session[:user_id].present?
        User.find session[:user_id]
      end
    end
  end


  private

  def enforce_login
    if current_user.blank?
      redirect_to :root
    end
  end
end
