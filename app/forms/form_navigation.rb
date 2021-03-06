class FormNavigation
  MAIN = [
    InterviewTypeController,
    HowItWorksController,
    LetsStartController,
    FeeAgentDetailsController,
    ClientDetailsController,
    WhichProgramController,
    RightsAndResponsibilitiesController,
    AnyNotListedController,
    AnyNotListedNamesController,
    AnyAwayFromHomeController,
    AnyAwayFromHomeNamesController,
    AnyoneConvictedDrugFelonyController,
    ConvictedDrugFelonyDetailsController,
    ResidencyController,
    AnyoneTribeController,
    TribeDetailsController,
    AnyoneStoppedWorkController,
    StoppedWorkDetailsController,
    QuestCardController,
    AnyoneFilingTaxReturnController,
    FilingTaxReturnDetailsController,
    WhatLivingExpensesController,
    ExpensesPaymentDetailsController,
    CamaDetailsController,
    OtherInformationController,
    ImportantConfirmationsController,
    ImportantDetailsController,
    NeededDocumentsSignpostController,
    CitizenController,
    ChildrenInHomeController,
    ParentNotInHomeController,
    PregnantController,
    ApprovedForDisabilityController,
    InterimAssistanceController,
    WantDirectDepositController,
    VerificationGuidanceController,
    AttachDocumentsSignpostController,
    HowToTakePhotosController,
    AddIdVerificationController,
    SuccessController,
  ].freeze

  class << self
    delegate :first, to: :form_controllers

    def form_controllers
      MAIN
    end
  end

  delegate :form_controllers, to: :class

  def initialize(form_controller)
    @form_controller = form_controller
  end

  def next
    return unless index

    form_controllers_until_end = form_controllers[index + 1..-1]
    seek(form_controllers_until_end)
  end

  private

  def index
    form_controllers.index(@form_controller.class)
  end

  def seek(list)
    list.detect do |form_controller_class|
      form_controller_class.show?(@form_controller.current_interview)
    end
  end
end
