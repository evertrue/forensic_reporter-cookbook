name             'forensic_reporter'
maintainer       'Evertrue, Inc.'
maintainer_email 'devops+cookbooks@evertrue.com'
license          'all_rights'
description      'Installs/Configures forensic_reporter'
long_description 'Installs/Configures forensic_reporter'
version          '1.0.4'

supports 'ubuntu', '>= 14.04'

source_url 'https://github.com/evertrue/forensic_reporter-cookbook' if respond_to?(:source_url)
issues_url 'https://github.com/evertrue/forensic_reporter-cookbook/issues' if respond_to?(:issues_url)

depends 'magic'
depends 'apt'
