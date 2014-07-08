module ApplicationHelper

	def verify_is_admin
  		(current_user.nil?) ? redirect_to(root_path) : (redirect_to(root_path) unless current_user.admin?)
	end

	 # Use callbacks to share common setup or constraints between actions.
    def set_panier
    	if !current_user.nil?
      		unless @panier = current_user.paniers.where(params[:id]).first
        	flash[:alert] = 'Create your first panier to start adding items'
        	# TODO create an empty panier
        	#redirect_to root_url
        end
      end
    end
end
