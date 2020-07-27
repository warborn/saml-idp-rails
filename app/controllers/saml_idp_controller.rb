class SamlIdpController < SamlIdp::IdpController
  def idp_authenticate(email, password)
    user = User.find_by(email: email)
    user&.valid_password?(password) ? user : nil
  end
  private :idp_authenticate

  def idp_make_saml_response(found_user)
    encode_response found_user
  end
  private :idp_make_saml_response

  def idp_logout
    user = User.by_email(saml_request.name_id)
    user.logout
  end
  private :idp_logout
end
