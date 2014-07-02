/*
 * Copyright (C) 2011 The CyanogenMod Project
 * Copyright (C) 2013 Mustaavalkosta
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

package com.cyanogenmod.settings.device;

import android.content.Context;
import android.os.Bundle;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.Preference.OnPreferenceChangeListener;
import android.preference.PreferenceFragment;
import android.preference.PreferenceScreen;
import android.preference.SwitchPreference;
import com.cyanogenmod.settings.device.R;

public class DevicePreferenceActivity extends PreferenceFragment  {

    public static final String KEY_COLOR_TEMP = "color_temp";

    private Context context;
    private CheckBoxPreference mColorTemp;

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        addPreferencesFromResource(R.xml.preferences);
        context = getActivity().getApplication();

        mColorTemp = (CheckBoxPreference) findPreference(KEY_COLOR_TEMP);
        mColorTemp.setChecked(ColorTemp.isEnabled());
        mColorTemp.setEnabled(ColorTemp.isSupported());
    }

    @Override
    public boolean onPreferenceTreeClick(PreferenceScreen preferenceScreen, Preference preference) {
        if (preference == mColorTemp) {
            if (mColorTemp.isChecked())
                ColorTemp.enable(context);
            else
                ColorTemp.disable(context);
            return true;
        }
        return super.onPreferenceTreeClick(preferenceScreen, preference);
    }
}
