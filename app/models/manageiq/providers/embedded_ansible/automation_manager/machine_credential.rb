class ManageIQ::Providers::EmbeddedAnsible::AutomationManager::MachineCredential < ManageIQ::Providers::EmbeddedAnsible::AutomationManager::Credential
  COMMON_ATTRIBUTES = {
    :userid   => {
      :label     => N_('Username'),
      :help_text => N_('Username for this credential')
    },
    :password => {
      :type      => :password,
      :label     => N_('Password'),
      :help_text => N_('Password for this credential')
    }
  }.freeze

  # rubocop:disable Layout/AlignHash
  #
  # looks better to align the nested keys to the same distance, instead of
  # scope just for the hash in question (which is what rubocop does.
  EXTRA_ATTRIBUTES = {
    :ssh_key_data => {
      :type       => :password,
      :multiline  => true,
      :label      => N_('Private key'),
      :help_text  => N_('RSA or DSA private key to be used instead of password')
    },
    :ssh_key_unlock => {
      :type       => :password,
      :label      => N_('Private key passphrase'),
      :help_text  => N_('Passphrase to unlock SSH private key if encrypted'),
      :max_length => 1024
    },
    :become_method => {
      :type       => :choice,
      :label      => N_('Privilege Escalation'),
      :help_text  => N_('Privilege escalation method'),
      :choices    => ['', 'sudo', 'su', 'pbrun', 'pfexec']
    },
    :become_username => {
      :type       => :string,
      :label      => N_('Privilege Escalation Username'),
      :help_text  => N_('Privilege escalation username'),
      :max_length => 1024
    },
    :become_password => {
      :type       => :password,
      :label      => N_('Privilege Escalation Password'),
      :help_text  => N_('Password for privilege escalation method'),
      :max_length => 1024
    }
  }.freeze
  # rubocop:enable Layout/AlignHash

  API_ATTRIBUTES = COMMON_ATTRIBUTES.merge(EXTRA_ATTRIBUTES).freeze

  API_OPTIONS = {
    :label      => N_('Machine'),
    :type       => 'machine',
    :attributes => API_ATTRIBUTES
  }.freeze

  def self.display_name(number = 1)
    n_('Credential (Machine)', 'Credentials (Machine)', number)
  end
end
