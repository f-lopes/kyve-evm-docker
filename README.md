# Kyve EVM node running on Docker :whale:

[![CI](https://github.com/f-lopes/kyve-evm-docker/actions/workflows/main.yml/badge.svg)](https://github.com/f-lopes/kyve-evm-docker/actions/workflows/main.yml)

The current supported Kyve EVM version is `v1.0.5`.

:information_source: [Kyve EVM repository](https://github.com/KYVENetwork/evm)

## Crafted using the best practices for containers

* [Container](https://github.com/GoogleContainerTools/container-structure-test) Structure tests
* [Trivy](https://github.com/aquasecurity/trivy#abstract): image vulnerabilities scanner
* [Dive](https://github.com/wagoodman/dive): image efficiency scanner
* [Distroless](https://github.com/GoogleContainerTools/distroless#why-should-i-use-distroless-images) runtime

## How to use

### Running a Kyve EVM protocol node

```shell
docker run -d --name kyve-evm-node -v <host_directory_containing_arweave_keyfile>:/arweave/ ghcr.io/f-lopes/kyve-evm-node:1.1.0-kyve-1.0.5 -p <pool_id> \
  --mnemonic "<your_mnemonic_phrase>" \
  --initialStake <initial_stake> --keyfile /arweave/arweave.json \
  --network korellia
```

#### Customize parameters as needed

See Kyve evm [documentation](https://github.com/KYVENetwork/evm#verify-that-your-binary-has-been-built-correctly)

:grey_question: See [Kyve EVM protocol node documentation](https://docs.kyve.network/intro/protocol-node.html) for more details.


## Feedback

Feel free to give any feedback in the [issues](https://github.com/f-lopes/kyve-evm-docker/issues) section.
