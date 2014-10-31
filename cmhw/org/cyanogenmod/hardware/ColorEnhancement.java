/*
 * Copyright (C) 2014 The CyanogenMod Project
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

package org.cyanogenmod.hardware;

import org.cyanogenmod.hardware.util.FileUtils;

import java.io.File;

/**
 * Color enhancement support
 */
public class ColorEnhancement {

    private static String COLOR_FILE = "/sys/module/mdp/parameters/mdp_gamma_cooler_colors";

    /**
     * Whether device supports an color enhancement technology.
     *
     * @return boolean Supported devices must return always true
     */
    public static boolean isSupported() {
        return new File(COLOR_FILE).exists();
    }

    /**
     * This method return the current activation status of the color enhancement technology.
     *
     * @return boolean Must be false when color enhancement is not supported or not activated, or
     * the operation failed while reading the status; true in any other case.
     */
    public static boolean isEnabled() {
        return Integer.parseInt(FileUtils.readOneLine(COLOR_FILE)) == 1;
    }

    /**
     * This method allows to setup color enhancement technology status.
     *
     * @param status The new color enhancement status
     * @return boolean Must be false if adaptive backlight is not supported or the operation
     * failed; true in any other case.
     */
    public static boolean setEnabled(boolean status) {
        if (status == true) {
            return FileUtils.writeLine(COLOR_FILE, "1");
        } else {
            return FileUtils.writeLine(COLOR_FILE, "0");
        }
    }

}

