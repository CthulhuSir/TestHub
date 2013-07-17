namespace :setup do
  task :travis do
    File.open(File.join(Rails.root, 'config', 'database.yml'), 'w+') do |database_yml|
      database_yml.write "test:\n  adapter: postgresql\n  encoding: unicode\n  database: test_hub_test\n  pool: 5\n  username: postgres\n  password:"
    end
    File.open(File.join(Rails.root, 'config', 'initializers', 'secret_token.rb'), 'w+') do |secret_token_rb|
      secret_token_rb.write "TestHub::Application.config.secret_key_base = '#{SecureRandom.hex(64)}'"
    end
    File.open(File.join(Rails.root, 'config', 'initializers', 'ssl.rb'), 'w+') do |ssl_rb|
      ssl_rb.write <<CONFIG
ServerKey = OpenSSL::PKey::RSA.new "-----BEGIN RSA PRIVATE KEY-----\nMIICXAIBAAKBgQDFmursutJiFq4gHvpba4IGAi3SViENJnx+I6lO5towro97jk1p\nTpYBtGZF0kvX3h48z7Rfq35X6Zlb7MNxpCe2Ieh197uyXPmliIYPc+kDOeeCiJzZ\n9JISh6SK0wS7WGdy0msa52RVXLlJPwSdzPIVORJaBnEWfQfURqEhjtrTFQIDAQAB\nAoGAS61/6TfHWM+M0jpq8VYkDr8I43Qe5lVl+j0YG2KoD1rbEpu2I+1336FCRd07\nNKoZdHqrfrREB9Er7ZuoYj5XAmp7CHwOsQELwDy9/i5RqheF6OGErspPfwuM9N/x\nqpgH+uzfltdkRemAhIzwZsv8mEhy5gZVVbBbH/GQ/frVKmECQQDl0auYy1a2OS0D\nL56xV06GXk8wrDPZop4dZ7efuoJh2KjMUQPMJZlhRd98bZBQdsmpLRYMeXlZiqMn\n4Vbbew09AkEA3B3HELTC1VNkrXXoNFjuPt9vI7O7z1+ta42nDrVnm+hxtPgOnD+g\n9zvoBDRiZOAv3AinQc9DkZ25vz2eam9quQJBAKaPwXgp1xyWb8MhXjhVeHn2HBrA\nk4umSkYxh2nieOCFcEE0bjYlAfb39zNtDOzkSt+r55D+8S4uRnV+4b6MflkCQF7U\nDVCrL0zMMpFwPGtg7LL1e2H8Kqs6YvH1AsWZbVuDlokKXPD/kI8ypdA56THgS34V\n1EjLzCZNtxomp7re6TECQBYG2Bv3qGi/aqGiGMuPjL/jUDZYEeuJrRL1qWb0vOKb\nw34Y/PJwMFdiqeurmBEaXhu6SorogpEFXFE9VGnHRjE=\n-----END RSA PRIVATE KEY-----"
ServerCert   = OpenSSL::X509::Certificate.new "-----BEGIN CERTIFICATE-----\nMIIEFjCCAf4CAQEwDQYJKoZIhvcNAQEFBQAwgZAxCzAJBgNVBAYTAlVTMRYwFAYD\nVQQIEw1NYXNzYWNodXNldHRzMQ8wDQYDVQQHEwZCb3N0b24xETAPBgNVBAoTCFJh\naXpsYWJzMREwDwYDVQQLEwhBcHBCbGFkZTEQMA4GA1UEAxMHVGVzdEh1YjEgMB4G\nCSqGSIb3DQEJARYRaGVscEBhcHBibGFkZS5jb20wHhcNMTMwNzAzMTMzMDE1WhcN\nMTQwNzAzMTMzMDE1WjCBlDELMAkGA1UEBhMCVVMxFjAUBgNVBAgTDU1hc3NhY2h1\nc2V0dHMxDzANBgNVBAcTBkJvc3RvbjERMA8GA1UEChMIUmFpemxhYnMxEDAOBgNV\nBAsTB1Rlc3RIdWIxFTATBgNVBAMTDGVibGluZy5sb2NhbDEgMB4GCSqGSIb3DQEJ\nARYRaGVscEBhcHBibGFkZS5jb20wgZ8wDQYJKoZIhvcNAQEBBQADgY0AMIGJAoGB\nAMWa6uy60mIWriAe+ltrggYCLdJWIQ0mfH4jqU7m2jCuj3uOTWlOlgG0ZkXSS9fe\nHjzPtF+rflfpmVvsw3GkJ7Yh6HX3u7Jc+aWIhg9z6QM554KInNn0khKHpIrTBLtY\nZ3LSaxrnZFVcuUk/BJ3M8hU5EloGcRZ9B9RGoSGO2tMVAgMBAAEwDQYJKoZIhvcN\nAQEFBQADggIBABNLckuSeakn5+lk94mbMDEpEpg63a4s9y9ooET7hVvRb0jeUgJ2\nIyy/pCDgHemKsQeAHNLs3+f3tKFjrvaQXZJqrRDDJzuPbvnCKyexhfSPzt8F0pLz\nMDkpwMPSbLkII4zOwHXaeLRs6ySKX0G1KePOEJVnWco8KanuDIZ5Sj1wcfOx8d9s\nNDhAy9DTtz/a2Rn0cphdVXVuffCfX5f7KOpF0ZOZrhEE4PQ2vYsMo4C5LAPZJ/vs\nCl0oVsphJUEXATWnFDjB1qaW8+UOvKoZyGAFdHiTYzidm4rN8/FmGeziJ9Srxb25\nBzUSCfmmtGDhyHS7u2mpR+IFathQ/qdT9VEIl/93uatgpPKMWOjZZ6n0tsSgMI9S\nyJMGAwkvQ9ZGxLoka5aF/xMPTEW/MG2nmiR3Bc44k/WXTGckGLTAJ6sqKGz4XxLT\nsiclvtQcRURst0E9aLigfW4KSCzGGVnJZ3ZJFs6nRy2t9OvyXc+x5610HR5K5LPA\nGhMbvZ2OxKy4TLrtxymzdkoLb6cs4/CdVWQHR4EUOvRDnwvkhZcdRC0SyG8uCej0\nxv+33SH1XKsFoeMrxdAc/QeimrpfSFaQ6H4pOLqipxTjqA9Qc0KC4ZUksiFQxrQs\n25qo0Z5dsUOR3ROeFu5LYenjsLYswmLm0vb2Z6g99RVYuaSHA9qP3GaM\n-----END CERTIFICATE-----\n"
ServerCA     = OpenSSL::X509::Certificate.new "-----BEGIN CERTIFICATE-----\nMIIGnjCCBIagAwIBAgIJALBvy+RnsTMgMA0GCSqGSIb3DQEBBQUAMIGQMQswCQYD\nVQQGEwJVUzEWMBQGA1UECBMNTWFzc2FjaHVzZXR0czEPMA0GA1UEBxMGQm9zdG9u\nMREwDwYDVQQKEwhSYWl6bGFiczERMA8GA1UECxMIQXBwQmxhZGUxEDAOBgNVBAMT\nB1Rlc3RIdWIxIDAeBgkqhkiG9w0BCQEWEWhlbHBAYXBwYmxhZGUuY29tMB4XDTEz\nMDcwMzEzMjcwOVoXDTE0MDcwMzEzMjcwOVowgZAxCzAJBgNVBAYTAlVTMRYwFAYD\nVQQIEw1NYXNzYWNodXNldHRzMQ8wDQYDVQQHEwZCb3N0b24xETAPBgNVBAoTCFJh\naXpsYWJzMREwDwYDVQQLEwhBcHBCbGFkZTEQMA4GA1UEAxMHVGVzdEh1YjEgMB4G\nCSqGSIb3DQEJARYRaGVscEBhcHBibGFkZS5jb20wggIiMA0GCSqGSIb3DQEBAQUA\nA4ICDwAwggIKAoICAQCkhOIKa6p82/ebL67YGMtKi/cMZz22YhE0YB5BLduojrJY\nC16wduODNOwWKJKQKuCKlHAPRj26SzJ9wjgC84KbIy1kUHFBflB0FdvX/Pzq09IC\n3dSzUgVNDubMNA9srfgmLmdf36cmXv+iDOxvpkIN6WbhpA8XdKlih88JUJl7KKJX\nLBWXs5ro32C20TQbZeqtWKMFfBgQKO6zUNeV5IBnGFTMpAEDS7l4mc1V+YQHkJHn\nN4NQ8j7/E39ZjFmdROefPkonSubhyzPrBcUokb13h17WjtYf64GQygLwJ/cY0WKz\nwtKS7qmLFA/7P63KVJQY7X6t6+yciwhiMpe8tDt3S/EomW3fX+XRc3gh03nCX7gT\nLFCscjD00FhKSIpRgz47ZyREv1YftocDZQa1QP6YIwpPgMQaVmVDGeZJeH10ZfMN\nI3Bngr/8DCEIQ3L8ZICTDaQdGe/tjUk5Tsqf9ZPIhV5S0+sjNBtMiVEyOQZLtIAF\nXePsVXDScSXmbZCdladYoMrpVFSefc4uPoYd7FVRtMxl/KRrwG73+Fn6Hei+IIw2\n5qW1E7xFvt69AlkFZl30auuq214/l1xFh0iYg6AeKEDDNqWGn8YNcMjOXWwCBAsA\n91/r9WnYOnxD1rMMNRKI0Op9qgs+SyYF/en/fgYIai4rShaXNmSlNG+HUj3KQwID\nAQABo4H4MIH1MB0GA1UdDgQWBBSaE7Mbog+LoxoWFN/1B+5i6J3bNjCBxQYDVR0j\nBIG9MIG6gBSaE7Mbog+LoxoWFN/1B+5i6J3bNqGBlqSBkzCBkDELMAkGA1UEBhMC\nVVMxFjAUBgNVBAgTDU1hc3NhY2h1c2V0dHMxDzANBgNVBAcTBkJvc3RvbjERMA8G\nA1UEChMIUmFpemxhYnMxETAPBgNVBAsTCEFwcEJsYWRlMRAwDgYDVQQDEwdUZXN0\nSHViMSAwHgYJKoZIhvcNAQkBFhFoZWxwQGFwcGJsYWRlLmNvbYIJALBvy+RnsTMg\nMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADggIBABORqxF+o0pUo3VZpLzC\nxtY2IRtFnKRW7Gd1eQNYfWrli+DO1BAYBJfPazQo1mgIRT0fN/0FOfCRn7YmSpLE\nfM/I8BXDqWXJ9c1Hjtg35aBu+C9Nt1TVwZLvGcFzPQ2j22Dhw5EVWmjalkviLVht\nRdoSliRzhyDrffwx1tZYyIhlcjrI5a/qpT9db0AmXiZJztNpDtEASM2AnV2bPPSE\nf8/Btp8Bc69ensiDBv8uLm2nYsm5u8BWlxxKa8p60IQpJJVTJ4/yZ/ePknBVMERj\npMl3MxpmgRdOT0cD6J7ROr7UgKOkXexuqCjQl51gUFyZQrgmw777utKSDzxjPWBf\nGD9fvelr25YCMnngQ9zY0vDiyI0RpvCLsa8OakAkv4EDk0t9DTi9KQhlnCGngc45\nuXYd/JLi8KgjPXnUQ9UJID+aEhuRsbj4mP2MXOeRe5YaHnnMxOE6gOxUr2aEjq5W\nRqHzmtdgNnNEV6IGoskTGQbXcI6etVT/4nPP5c/uP4A6DGasdxzVqCP9LhWG408j\nvYM6PKT6xCfPm4w0J+KdjLmOecmWMy/UmCudCSTKm8gfLYm26sEUNIRm/b1kIY9I\nR4+TRs0/Guz7EYHY3DzG9WRrnXcCqc46UDKsNdO4LXuldcJ4NcXMpqLj6IFALV57\ns+GEQZ+GMWIPjqPx/jvzcBKF\n-----END CERTIFICATE-----\n"
ServerChain  = [ServerCA]

SCEPKey   = OpenSSL::PKey::RSA.new          "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n"
SCEPCert  = OpenSSL::X509::Certificate.new  "-----BEGIN CERTIFICATE-----\nMIIGnjCCBIagAwIBAgIJAObErZOA68vUMA0GCSqGSIb3DQEBBQUAMIGQMQswCQYD\nVQQGEwJVUzEWMBQGA1UECBMNTWFzc2FjaHVzZXR0czEPMA0GA1UEBxMGQm9zdG9u\nMREwDwYDVQQKEwhSYWl6bGFiczERMA8GA1UECxMIQXBwQmxhZGUxEDAOBgNVBAMT\nB1Rlc3RIdWIxIDAeBgkqhkiG9w0BCQEWEWhlbHBAYXBwYmxhZGUuY29tMB4XDTEz\nMDcwMzEzMzIyM1oXDTE0MDcwMzEzMzIyM1owgZAxCzAJBgNVBAYTAlVTMRYwFAYD\nVQQIEw1NYXNzYWNodXNldHRzMQ8wDQYDVQQHEwZCb3N0b24xETAPBgNVBAoTCFJh\naXpsYWJzMREwDwYDVQQLEwhBcHBCbGFkZTEQMA4GA1UEAxMHVGVzdEh1YjEgMB4G\nCSqGSIb3DQEJARYRaGVscEBhcHBibGFkZS5jb20wggIiMA0GCSqGSIb3DQEBAQUA\nA4ICDwAwggIKAoICAQDMwHtQAEJpr7/5l3gKodRXGXGs0zCoru3UflcSSJcs+65M\nh4PmONQDW0Qh9tVU0x6YX9YlAALdj2rsHiCnvHFsMnmTzhQc4K4ZRaxaQuwpNDqg\nxWHh5bthXpUSr3AxUcdLJfyn3ZE6a5ZBChEkBul0fU3yib/aB/D0Sgw41MmJHw6Q\nfOKuJMyPPnOtNuDs4qm0+gtq3MnrMbf1PVuj4yIdIFfkSoAYLE9cy4fL4duYIO1E\n5Ys9+cWW/GTQwWXD2pS4Ayq8tr1qyZixCWvA/NxxrjRxVbHCkrb2mUN1UZFxA1UL\nPJIj5Q5gND48Hls7Yd39oIQahuNaYKTHAZBDKq66vRMBAfZxa5ZNMtcU6ZzQL8Pm\nFMniaCjTFhzWujEtVVmkspXvwanZHGm0ILg/YGlutjhq7sZRWUbK0q4z6zdcoZeg\n/lWhr3dehED6vak0GE+FG7ybigfgMN+JT4E3DEcRM3226ApBPokuFNwF9Gt2bWJJ\naYpgSRpbgl1LXb4HXVp9symw7q+hko43MTMmpv9nbw6TVisOOqYUez8Owsx6IKtn\nWtSM9qE3uZt4aqk0G5n+HZTZ3KzDxNYOEYLcawntBXgCeTVHRRLMLxUJnjBVZuvo\nMa7yw+i8x6f+QVOymJClopuDcdaohwi4Jdb44dhmZXI13ntXex9IqgfjWQYCVQID\nAQABo4H4MIH1MB0GA1UdDgQWBBTjuwfn2k4UioV90zfPfoRxdPgnLDCBxQYDVR0j\nBIG9MIG6gBTjuwfn2k4UioV90zfPfoRxdPgnLKGBlqSBkzCBkDELMAkGA1UEBhMC\nVVMxFjAUBgNVBAgTDU1hc3NhY2h1c2V0dHMxDzANBgNVBAcTBkJvc3RvbjERMA8G\nA1UEChMIUmFpemxhYnMxETAPBgNVBAsTCEFwcEJsYWRlMRAwDgYDVQQDEwdUZXN0\nSHViMSAwHgYJKoZIhvcNAQkBFhFoZWxwQGFwcGJsYWRlLmNvbYIJAObErZOA68vU\nMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADggIBALZ4URLZuzLxc0rVkstQ\nrftf443UFAol4W/h14kNJU0rAwf6doWeddK9A0DQsuEWdDKDzTNBimQoqTl74J0+\nkfy4B6QZAbzv8+MwggEhujzOaXX7lV9sC6elgz6G4PVRYvQBPOLeZ0xevopdpLpP\nuStPUDJb4LmAZWqldosQQDBWzO20rc4O40q6Rm2XcbDBasHeFd/DsU9PSPuIjieQ\nxKkTjjuYZJhtP0z8ZiYISixdo/E2niXNewwDyjRiW1zcwYAWdHnkvL58ri8PXUnT\nG0uy57JnIeRv5g4R77PD1a0uQOWJNua6v3ZxfPdRh9aV6EZzwcwRlpwLNlgE68Uj\nqjlC4O4QfRaszcEneOY7RBwU/Ml4uadtkeb2mf4GrpPdDYRgEooWL0URKbDvmSV2\nDRvaQdwpSMGtKgg1x9TVO0oTduByxAEM/4m3b9T9N4KyQVatHbsEqx8B/+ZQu8Uo\nmXGajJC8dKrGJdPLc4V/9PMbzaZRF4CXaOYabu5xFlS1rYLiI6KAl5v+gFlhiNed\nTRP9nD+g+DtryNQaFqJV9hsnIpLHJF8EzKKFA5j/n7LUknG+TtWHAXA4Tbi1bQjI\nqsGXa1EFk2Tt+762MA4pmLceTKjEWjSDnJZLb7b/rN/juP6IWXwRnzZz3epwNP6f\n3g0kZHji9JvJ9wpt2Kw5BHVV\n-----END CERTIFICATE-----\n"
SCEPStore = OpenSSL::X509::Store.new
SCEPStore.add_cert SCEPCert

ProfileServiceKey   = OpenSSL::PKey::RSA.new          "-----BEGIN RSA PRIVATE KEY-----\n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\n-----END RSA PRIVATE KEY-----\n"
ProfileServiceCert  = OpenSSL::X509::Certificate.new  "-----BEGIN CERTIFICATE-----\nMIIGnjCCBIagAwIBAgIJAPqPt87nSzOHMA0GCSqGSIb3DQEBBQUAMIGQMQswCQYD\nVQQGEwJVUzEWMBQGA1UECBMNTWFzc2FjaHVzZXR0czEPMA0GA1UEBxMGQm9zdG9u\nMREwDwYDVQQKEwhSYWl6bGFiczERMA8GA1UECxMIQXBwQmxhZGUxEDAOBgNVBAMT\nB1Rlc3RIdWIxIDAeBgkqhkiG9w0BCQEWEWhlbHBAYXBwYmxhZGUuY29tMB4XDTEz\nMDcwMzEzMzM1OFoXDTE0MDcwMzEzMzM1OFowgZAxCzAJBgNVBAYTAlVTMRYwFAYD\nVQQIEw1NYXNzYWNodXNldHRzMQ8wDQYDVQQHEwZCb3N0b24xETAPBgNVBAoTCFJh\naXpsYWJzMREwDwYDVQQLEwhBcHBCbGFkZTEQMA4GA1UEAxMHVGVzdEh1YjEgMB4G\nCSqGSIb3DQEJARYRaGVscEBhcHBibGFkZS5jb20wggIiMA0GCSqGSIb3DQEBAQUA\nA4ICDwAwggIKAoICAQCq4pwnKWF/k1tQyxb+vrihGGRGXo7o2X+DQ5Jy3U7+2gha\npRGnuXBAscge2fEYzM1lc/Trtzsvv3buU2OLHXgP2bh7zODwp3rlfKC51d/nuumm\nKQlfEBd/v+BNAnQXokXXxerZ50EedqobajA2D3cKispy2xQWpZLxHwNlENLB9VPQ\nbSJmCcae8ONlnP3ZSbPTdoOT2skcFhv0KxVWc0r6iPqhXsffnDn5k8rXFDjaH4LR\n3YQk+lC3MHPNFJasCDdgHx44/13eUoUdAEs+bfga3CT1WNa1SGI/mSiUmelYAwqb\n6FMBmDzAWSgyJXf2zEKcld+G44Pr8kAr3nwTaMuQx+ZVcAEr4HwSZ+j6i4lBGAyx\nU15F4MifFyy3iToFCThQn1YHuNshMcYZ29pSILqA1zI+bNdEFF4wMAqWCuvl2Uj9\ned5GprB1u1npLJe/WqO/zV56aPfVCtFtN18573L6dHvBt4G6BJc+cfXzTxChcsuJ\n6EXXIqvrqxOwta/P40Mm7M6mf3PHHyH6zHSWrPkIRXAmCh9+fcWlHjiQrUr23yqS\nEMq6Vny+pSGXY9ObzOk7cWCJ3CTRRuSHjrbmz81kvK00OP3kyxP/Nbxz5ay+22uH\nTSgAXuj56TQqNdygY78TbmWWzAqwDbqbEBVHhzWyabqjHPrw1J88X4jGwAj6xwID\nAQABo4H4MIH1MB0GA1UdDgQWBBRT80iq4Lt6Bo8K/CoGzSNu2ncs/DCBxQYDVR0j\nBIG9MIG6gBRT80iq4Lt6Bo8K/CoGzSNu2ncs/KGBlqSBkzCBkDELMAkGA1UEBhMC\nVVMxFjAUBgNVBAgTDU1hc3NhY2h1c2V0dHMxDzANBgNVBAcTBkJvc3RvbjERMA8G\nA1UEChMIUmFpemxhYnMxETAPBgNVBAsTCEFwcEJsYWRlMRAwDgYDVQQDEwdUZXN0\nSHViMSAwHgYJKoZIhvcNAQkBFhFoZWxwQGFwcGJsYWRlLmNvbYIJAPqPt87nSzOH\nMAwGA1UdEwQFMAMBAf8wDQYJKoZIhvcNAQEFBQADggIBAAOscZregGwnzfk+jp0b\nzUmEuHDjxjYrfSxyvJOIkVxDMowFi53IZs1VmsJWjjsRVqjzKVL91tAIjc3S5yXe\nF7EE/lKOMpX7275Crogd6NBvesqON9hJlbD5ZoMWf3xkWSG90EEj0k1m4crmiWc+\ng/NTXV8V8vvk1ta2IjCJqP8CnIJyGmZVmht5OAsfmohxkKX6J5OLx7cJON8cRpg/\nH4RVeyiKvRHfILeZdctp0+KfSEAwN7Xld6Se6rbc6cGMH6r9mvhiExEMEBEz6Jk0\n4I3fe36w+1Zg41yDdnnAUBQSPgHB3Lahu/NPra9GoO2o62syRkTShtX5f2CZU1dN\n91IvoZcblJnZxDYC0M7uuboJ+HgYoeCNWeRZQU/dgAZedPdsqC1zwVHF/7723My/\nz5F/cmhWKvjvXwon0rfBaBqA6yKqi2bXtkwGVltu57K7bOiZKlC4MCRuZuu+ZTN2\nkaNgc/ox/OEXcbDwc0RShsIFUFkJQfxi8qr9j2+kw677Pw8iRUpjCSM4KUxdNk2k\n+631fKziloEhFH6Nntw0bQ3VL/jiBqJWFwh7h0LAPDsd/DzQuYLRLQp0jatHQcvT\nqJh71gf/mc4G/rR/kViONJlWOIgx5jTM1O0UMJl5/MnwxdD9VTDdKRs+caaalmMV\n2hmYRpwOWJCad61EvcE25s9w\n-----END CERTIFICATE-----\n"
ProfileServiceStore = OpenSSL::X509::Store.new
ProfileServiceStore.add_cert ProfileServiceCert

DatabaseKey = OpenSSL::PKey::RSA.new "-----BEGIN RSA PRIVATE KEY-----\nMIIEpAIBAAKCAQEAx5p0Wt9NtplCf27CWVlIQjSpiEkx7nxELcSHgQSpUyEhrMtQ\ngIu81362Wpz779D8QeUR7VuZpccGKnWc0QtEgYo+tqfGCqmwWUBafNHwVkPFJ681\nteMXwdg3hpz/iXrcOuSi/KpecrgwQHP56xVNOlTeS/Od10WKVTl2ewrlg34bdyPK\nBMmWcwSst8YJZP2aopm9uvm75MsHBMiSME0zszb757Vk2c2pb083nt/ILQygjqzH\nFjjqbnzQxezUSv79X8IXSQsst8Rz2vb8JqG98ttzKU1BhAkhXgPh6tIF4g0Jv7dB\njoESw55TUmRu/VjSYkKFtYiJgs/gobNCMQbAcwIDAQABAoIBAQCgepMAGLcvjwsC\nz7ccBQdui06ej1LAzlI2heL4HRpSBro/ZfukTjUXAP513e9Ewb5+8EA4mMPwoBJa\nAtOA0tFSYSbIzh0Qp5tsNqxJ3LShdr1Fib3iLeIE7OS/quxcyVXVV8ue3w8upt3M\nhDI0Cp1bv642XHjUAkoU+S1EAd/DlixgXWP4b46hvsOClQDLBwdW02FxHierJajM\n5xsEydToCR/CFLRiC0RonZ9w7TOT2wb44vWa0ZfELfh84Of0t2N9mAM57WN2ifK3\neMgwvbbFRXSObEhMQolD7UvkhbvJyM1rhirm6GrHK2ySqsf+F2vHaoXsVy8S432t\nxuDBNl+JAoGBAPdofD7XDgt3Eqb1HB9M7yoN9lAFI6gksBagcJxcoSMDQTFKq2oi\nHqepOjJD+pPi2NgdCSd9ECiWaivUr4zhsNJbVfisxpJSLK79+mjEcaD6xle0nwbD\nPEOg6yUyz6UC/U7cMlV0bRwS3JfJRluDEhyDzx9NctK/2eNKZBKMGOiFAoGBAM6I\n+TusvIihlHh2oV3Rm9rSjUNBEZNX37lE9oDyMa0CvUX61w9UHCzxNgPK9W3jI/lm\nEkTT5c8TKxCX2vj6Mb1nh1t2rzOu71toOXCiBkErgP3MzN0hu7kHw7CUB2kKdG+z\nnwKrV1aTQ7zqPMsToNxdHtm6nGyHKNiFnPVo31KXAoGBALybecRKG9nfr2d6CjNO\najDsLe84y8L+HQNS0iZRc0IG1Cconl6tniMAnm39ZsRgtiCimfzxmWTnrg61+BJ1\nZ2Al4vdNd5/KZ2gMFF7UCy/GnXf1KRp1sbZ4sWpNPwCzs7nvoauFszwooORRu4I9\n/IuibD6Xw0YonYlph7qf9MklAoGAOvNZwDCzt4P3LtMdh/vWMoU6kOG3tIi2cNlA\nStnWV/2aLKlGTTfCuwk2U6rQlsboc70wpbidtZdRCXFurPYs0FUGi5K6u1PJOhvr\nmTyF8IAMV2TnbI6+WDfhITt/SfoT9fYdAtQJH8r04K0zIPu/RGbH8XmUQF3ryLGK\ndXmzlI0CgYB2iZGMQGYCjICWHNfyDV6LyRNf8bvlHIIxx6A6oawkhSrWgTcJ53db\nDT8KhUMJKTDqxJRx+dqHu5fBl8ukNOj243jKG62weF8B+HtPmJgjpZc5nnPWbi4k\nQaWqf2saC0jCotSz1QvB/YE2YWfMp667xrx409AAaI1q5CQx7+ZxAg==\n-----END RSA PRIVATE KEY-----\n"
CONFIG
    end
  end
end