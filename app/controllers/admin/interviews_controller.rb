module Admin
  class InterviewsController < Admin::ApplicationController
    # To customize the behavior of this controller,
    # you can overwrite any of the RESTful actions. For example:
    #
    # def index
    #   super
    #   @resources = Interview.
    #     page(params[:page]).
    #     per(10)
    # end

    # Define a custom finder by overriding the `find_resource` method:
    # def find_resource(param)
    #   Interview.find_by!(slug: param)
    # end

    # See https://administrate-prototype.herokuapp.com/customizing_controller_actions
    # for more information

    def show
      respond_to do |format|
        format.html do
          super
        end
        format.pdf do
          final_output_file = Tempfile.new(["final_output", ".pdf"], "tmp/")

          PdfForms.new.fill_form(
            "app/lib/pdfs/FA1.pdf",
            final_output_file.path,
            Fa1InterviewPdfDecorator.new(find_resource(params[:id])).attributes,
          )

          send_file final_output_file, type: "application/pdf", disposition: "inline"
        end
      end
    end
  end
end
