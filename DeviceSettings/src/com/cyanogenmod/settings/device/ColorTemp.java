package com.cyanogenmod.settings.device;

import android.content.Context;
import android.content.SharedPreferences;
import android.content.SharedPreferences.Editor;
import android.preference.CheckBoxPreference;
import android.preference.Preference;
import android.preference.PreferenceManager;

public class ColorTemp {

    private static final String FILE = "/sys/module/mdp/parameters/mdp_gamma_cooler_colors";

    public static boolean isSupported() {
        return Utils.fileExists(FILE);
    }

    public static boolean isEnabled() {
        if (!isSupported())
            return false;
        return Utils.readOneLine(FILE).equals("Y");
    }

    public static void restore(Context context) {
        if (!isSupported())
            return;
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        if (sharedPrefs.getBoolean(DevicePreferenceActivity.KEY_COLOR_TEMP, false))
            Utils.writeValue(FILE, "Y");
        else
            Utils.writeValue(FILE, "N");
    }

    public static void enable(Context context) {
        if (!isSupported())
            return;
        Utils.writeValue(FILE, "Y");
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPrefs.edit();
        editor.putBoolean(DevicePreferenceActivity.KEY_COLOR_TEMP, true);
        editor.commit();
    }

    public static void disable(Context context) {
        if (!isSupported())
            return;
        Utils.writeValue(FILE, "N");
        SharedPreferences sharedPrefs = PreferenceManager.getDefaultSharedPreferences(context);
        SharedPreferences.Editor editor = sharedPrefs.edit();
        editor.putBoolean(DevicePreferenceActivity.KEY_COLOR_TEMP, false);
        editor.commit();
    }

}
