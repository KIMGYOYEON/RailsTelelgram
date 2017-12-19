class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # < : 상속

  protect_from_forgery with: :exception

  def current_user

    @user = User.find(session[:user_id]) if session[:user_id]   # 이렇게 선언하면, IF 문이 충족되었을 경우에만 실행해준다.
    # ruby는 따로 리턴을 하지 않아도 리턴된다
  end

  helper_method :current_user
  # 이 함수를 헬퍼 메소드에 심고 싶어.

#  before_action "함수명"
#  모든 컨트롤러가 발동되기 여기서 지정된 함수가 발동된다.
#  따라서 여기에서 로그인 여부를 체크할 수 있다


  def authorize #로그인되었는지 판별해라
    unless current_user
      redirect_to '/users/login' unless current_user
    end
  end

end
