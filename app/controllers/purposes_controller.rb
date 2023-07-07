class PurposesController < InheritedResources::Base

  private

    def purpose_params
      params.require(:purpose).permit(:version, :time, :type_question, :question, :answer)
    end

end
