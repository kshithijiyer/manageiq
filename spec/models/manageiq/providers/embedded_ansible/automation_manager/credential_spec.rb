describe ManageIQ::Providers::EmbeddedAnsible::AutomationManager::ScmCredential do
  let(:manager) do
    FactoryBot.create(:provider_embedded_ansible, :default_organization => 1).managers.first
  end

  before do
    EvmSpecHelper.assign_embedded_ansible_role
  end

  # it_behaves_like 'ansible credential'
end
