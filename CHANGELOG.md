# K8s ClamAV

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

<!-- ## [UNRELEASED]
### Added
### Changed
### Deprecated
### Removed -->

## v2.0.1 - 2024-04-02

### Changed

- Versioning test

## v2.0.0 - 2024-04-02

### Changed

- Updated clamav chart to `0.14.0`

## v1.4.4 - 2023-10-30

### Added

- Add logic for Terraform re-deploy when updating helm chart files

## v1.4.3 - 2023-10-30

### Changed

- Updated clamav chart to `0.12.0`

## v1.4.2 - 2023-10-16

### Changed

- Add versioning Workflow
- Add the ClamAV Helm Chart inside the ClamAV Terraform module
- Move the ClamAV Terraform module to LexisNexis-RBA GitHub
- Updated clamav chart to `0.11.0`

## v1.4.0 2023-08-21

### Changed

- Updated clamav chart to `0.10.0`

## v1.3.0 2023-08-17

### Changed

- Updated clamav chart to `0.9.0`

## v1.2.0 2023-03-27

### Changed

- Updated clamav chart to `0.8.0`

## v1.1.0 2022-02-17

### Added

- Add yara rule to block excel files with macros

### Changed

- Updated clamav chart to `0.6.0`

## v1.0.1 2021-10-08

### Added

- Increase memory request and limit, due to OOM restarts.

## v1.0.0 2021-10-05

### Added

- Initial version
