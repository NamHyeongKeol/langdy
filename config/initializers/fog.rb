CarrierWave.configure do |config|
	config.fog_credentials = {
		provider:              'AWS',
		aws_access_key_id:     'AKIAJ4CU44RSKJILMOOQ',
		aws_secret_access_key: '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',
		region:                'ap-northeast-2'
	}
	config.fog_directory  = 'langd-profile-pic'
end
