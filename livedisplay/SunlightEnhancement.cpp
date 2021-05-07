/*
 * Copyright (C) 2019 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define LOG_TAG "SunlightEnhancementService"

#include <android-base/logging.h>
#include <android-base/properties.h>
#include <string>
#include <utils/Errors.h>
#include <fstream>

#include "SunlightEnhancement.h"

namespace vendor {
namespace lineage {
namespace livedisplay {
namespace V2_0 {
namespace implementation {

#define HBM_ENABLED  1
#define HBM_DISABLED 0

//static constexpr const char* kHbmSupportedPath = "/sys/devices/virtual/panel/brightness/irc_support";
static constexpr const char* kHbmEnabledPath = "/sys/devices/virtual/panel/brightness/irc_brighter";

Return<bool> SunlightEnhancement::isEnabled() {
    std::ifstream hbm_status_file(kHbmEnabledPath);
    int result = -1;
    hbm_status_file >> result;
    return !hbm_status_file.fail() && result > 0;
}

Return<bool> SunlightEnhancement::setEnabled(bool enabled) {
    std::ofstream hbm_enable_file(kHbmEnabledPath);
    hbm_enable_file << (enabled ? HBM_ENABLED : HBM_DISABLED);
    return !hbm_enable_file.fail();
}

}  // namespace implementation
}  // namespace V2_0
}  // namespace livedisplay
}  // namespace lineage
}  // namespace vendor