package com.iloatnew.cb.ui.res

import androidx.compose.runtime.Composable
import androidx.navigation.NavHostController
import androidx.navigation.compose.NavHost
import androidx.navigation.compose.composable
import androidx.navigation.compose.rememberNavController
import com.iloatnew.cb.ui.screen.SplashScreen
import kotlinx.serialization.Serializable

@Serializable
sealed class AppDestinations {
    @Serializable
    object Splash
}

@Composable
fun AppNavHost(navController: NavHostController = rememberNavController()) {
    NavHost(navController = navController, startDestination = AppDestinations.Splash) {
        composable<AppDestinations.Splash> {
            SplashScreen()
        }
    }
}
