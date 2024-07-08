@rem Copyright 2019 Google LLC. All rights reserved.
@rem
@rem Licensed under the Apache License, Version 2.0 (the "License");
@rem you may not use this file except in compliance with the License.
@rem You may obtain a copy of the License at
@rem
@rem     http://www.apache.org/licenses/LICENSE-2.0
@rem
@rem Unless required by applicable law or agreed to in writing, software
@rem distributed under the License is distributed on an "AS IS" BASIS,
@rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@rem See the License for the specific language governing permissions and
@rem limitations under the License.

FOR %%P IN ("3.8", "3.9", "3.10", "3.11", "3.12") DO (
    FOR %%V IN (%%P-32, %%P-64) DO (
        py -%%V -m pip install --no-index --find-links=wheels google-crc32c --force-reinstall

        py -%%V ./scripts/check_crc32c_extension.py

        py -%%V -m pip install pytest
        py -%%V -m pytest tests
    )
)
