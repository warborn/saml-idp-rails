class SamlIdpController < SamlIdp::IdpController
  before_action :authenticate_user!, except: [:show]

  def create
    if user_signed_in?
      @saml_response = idp_make_saml_response(current_user)
      render template: 'saml_idp/idp/saml_post', layout: false
      nil
    else
      render status: :forbidden
    end
  end

  private

  def idp_make_saml_response(found_user)
    encode_response found_user
  end

  def idp_logout
    user = User.by_email(saml_request.name_id)
    sign_out user
  end
end
