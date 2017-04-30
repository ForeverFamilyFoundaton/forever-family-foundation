class RelationshipsController < InheritedResources::Base

  private

    def relationship_params
      params.require(:relationship).permit(:name, :typeof)
    end
end

